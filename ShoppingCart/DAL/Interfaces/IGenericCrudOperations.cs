using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCart.DAL.InterFaces
{
    interface IGenericCrudOperations<TEntity>
    {
        IQueryable<TEntity> Get();

        TEntity GetById(int id);

        bool AddEntity(TEntity obj);

        bool RemoveEntity(TEntity obj);

        bool UpdateEntity(TEntity obj);

        IQueryable<TEntity> SearchFor(Expression<Func<TEntity,bool>> predicate);

    }
}
