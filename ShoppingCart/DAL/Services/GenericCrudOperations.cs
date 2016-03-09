using System;
using System.Linq;
using System.Linq.Expressions;
using System.Data.Entity;
using ShoppingCart.DAL.InterFaces;

namespace ShoppingCart.DAL.Services
{
    public class GenericCrudOperations<TEntity> : IGenericCrudOperations<TEntity> where TEntity : class
    {
        protected readonly DbContext Db; 
        protected readonly DbSet<TEntity> dbSet;

        public GenericCrudOperations(DbContext _DbContext)
        {
            this.Db = _DbContext;
            this.dbSet = _DbContext.Set<TEntity>();
        }
        public bool AddEntity(TEntity obj)
        {
            try
            {
                Db.SaveChangesAsync();
                return true;
            }
            catch (Exception e)
            { 
                
                return false;
            } 
        }

        public IQueryable<TEntity> Get()
        {
            return dbSet;
        }

        public TEntity GetById(int id)
        {
            return dbSet.Find(id);
        }

        public bool RemoveEntity(TEntity obj)
        {
            try
            {
                dbSet.Remove(obj);
                Db.SaveChangesAsync();
                return true;
            }
            catch (Exception e)
            {

                return false;
            }
        }

        public IQueryable<TEntity> SearchFor(Expression<Func<TEntity, bool>> predicate)
        {
           return dbSet.Where(predicate);
        }

        public bool UpdateEntity(TEntity obj)
        {
            try
            {
                Db.Entry(obj).State = EntityState.Modified;
                Db.SaveChangesAsync();
                return true;
            }
            catch (Exception e)
            {

                return false;
            }
        }
    }
}
